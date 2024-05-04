// Copyleft 🄯 2024  PW-Sync Team

use std::{ fs, env, process, io::Read };
use is_root::is_root;
use toml::Table;

pub fn path_exists(path: &str) -> bool {
    fs::metadata(path).is_ok()
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

    conf = format!("{conf}/config.toml");

    let mut file = fs::File::open(conf).expect(" < !! > Failed to open PWSync config");
    let mut contents = String::new();
    file.read_to_string(&mut contents)
        .expect(" < !! > Failed to read PWSync config");

    print!("{}", contents);
}
