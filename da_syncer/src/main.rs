// Copyleft 🄯 2024  PW-Sync Team

use std::{ fs::metadata, env, process };
use is_root::is_root;

pub fn path_exists(path: &str) -> bool {
    metadata(path).is_ok()
}

fn main() {
    if is_root() {
        println!(" < !! > nuh uh. i no want be root!");
        process::exit(1);
    }

    let mut conf = env::var("XDG_CONFIG_HOME").unwrap();

    println!(" < Para Wodna Sync for Linux >\n");

    conf = format!("{conf}/pwsync");
    if !path_exists(&conf) {
        println!(" < !! > PWSync config not found. Did you use the install script?");
        process::exit(2);
    }
}
