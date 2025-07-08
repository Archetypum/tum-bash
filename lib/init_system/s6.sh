#!/bin/bash
#
# `lib/init_system/s6.sh`
#
# Copyright (C) 2025 Archetypum
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>
use std::process::{Command, ExitStatus};

const RED: &str = "\x1b[0;31m";
const GREEN: &str = "\x1b[0;32m";
const RESET: &str = "\x1b[0m";

fn execute_s6_rc(action: &str, service: &str) -> std::io::Result<ExitStatus> 
{
    let mut cmd = Command::new("s6-rc");
    cmd.arg(action);
    
    if !service.is_empty() 
    {
        cmd.arg(service);
    }

    let status = cmd
        .stdout(std::process::Stdio::null())
        .stderr(std::process::Stdio::null())
        .status()?;

    if status.success() 
    {
        println!("{}[*] Success!{}", GREEN, RESET);
    } 
    else 
    {
        println!("{}[!] Error: s6-rc {} {} failed.{}", 
               RED, action, service, RESET);
    }

    Ok(status)
}

macro_rules! s6_rc_command 
{
    ($name:ident, $action:literal, $with_service:expr) => 
    {
        pub fn $name(service: Option<&str>) -> std::io::Result<ExitStatus> 
        {
            execute_s6_rc($action, if $with_service { service.unwrap_or_default() } else { "" })
        }
    };
}

s6_rc_command!(start_s6_rc, "start", true);
s6_rc_command!(stop_s6_rc, "stop", true);
s6_rc_command!(change_s6_rc, "change", true);

s6_rc_command!(help_s6_rc, "help", false);
s6_rc_command!(list_s6_rc, "list", false);
s6_rc_command!(listall_s6_rc, "listall", false);
s6_rc_command!(diff_s6_rc, "diff", false);
