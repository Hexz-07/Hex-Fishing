# Fishing Script Installation Guide

## Configuration

Open `config.lua` and set your framework and inventory system:

```lua
Config.Framework = 'esx' -- Options: 'esx' or 'qbcore'
Config.Inventory = 'ox'  -- Options: 'ox' (ox_inventory), 'esx' (esx default), 'qb' (qbcore default)
```

### Configuration Options:
- **Framework**: Choose between `'esx'` or `'qbcore'`
- **Inventory**: 
  - `'ox'` - For ox_inventory (works with both ESX and QBCore)
  - `'esx'` - For default ESX inventory
  - `'qb'` - For default QBCore inventory

## Required Libraries

1. **ox_lib** - Download from GitHub:  
   https://github.com/overextended/ox_lib/releases/tag/v3.30.6

2. **ox_inventory** (Optional - only if using Config.Inventory = 'ox'):  
   https://github.com/overextended/ox_inventory/releases/tag/v2.44.1

## Installation Steps

### Step 1: Install Required Libraries

Ensure **ox_lib** is installed on your server. If using `Config.Inventory = 'ox'`, also install **ox_inventory**.

### Step 2: Upload Fishing Script Files

1. Download the Fishing Script files
2. Place the fishing script folder in your server's `resources` directory

### Step 3: Upload Image Files (If using ox_inventory)

If using `Config.Inventory = 'ox'`:
- Navigate to `ox_inventory/web/images/` directory
- Upload all fish image files from the package to this directory

### Step 4: Configure Items

**For ox_inventory:**
- Navigate to `ox_inventory/data/items.lua`
- Add the fish items configuration (provided in `oxconfig.md`)

**For ESX default inventory:**
- Navigate to your ESX database
- Add the fish items to your `items` table

**For QBCore default inventory:**
- Navigate to `qb-core/shared/items.lua`
- Add the fish items configuration

### Step 5: Update server.cfg

Add the following line to your `server.cfg`:

```
ensure fishing-script
```

(Replace `fishing-script` with your actual resource folder name)

## Item Configuration Examples

### For ox_inventory (items.lua)
See `oxconfig.md` for the complete item configuration.

### For ESX Database
Insert items into your `items` table with appropriate names, labels, and weights.

### For QBCore (qb-core/shared/items.lua)
```lua
['bass'] = {['name'] = 'bass', ['label'] = 'Bass', ['weight'] = 720, ['type'] = 'item', ['image'] = 'bass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A freshly caught bass'},
```

## Support

For issues or questions, join our Discord:  
https://discord.gg/ec7rmMHPTG

## Notes

- The script uses ox_lib for UI elements (works with both ESX and QBCore)
- Money handling is framework-specific (ESX uses `addMoney`, QBCore uses `AddMoney('cash')`)
- When using ox_inventory, money is added as an item; otherwise, it's added directly to the player's account