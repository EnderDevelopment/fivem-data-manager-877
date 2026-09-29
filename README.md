# FiveM Data Manager

A comprehensive FiveM script that handles player data management with database integration. It includes features for updating and retrieving player values, making it a useful tool for server administrators.

## Features

- Player data management with database integration
- Customizable default values and debug settings

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start fivemscript` to your server.cfg file
4. Run the database.sql file to create the necessary table

## Usage

### Commands

| Command | Description |
|---------|-------------|
| /fivemscript | Increases the player's value by 10 |

### Permissions

The script uses ESX's permission system. Ensure players have the 'user' permission to use the /fivemscript command.

## Configuration

The script can be configured in the config.lua file. Here are the available options:

```lua
Config = {}

-- Database configuration
Config.Database = {
    TableName = 'fivemscript_data'
}

-- Script settings
Config.ScriptSettings = {
    EnableDebug = false,
    DefaultValue = 100
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fivem-data-manager&utm_content=bottom) — describe it in one sentence and get the full source code.