# Kanban Lookup (AutoHotkey)

Lightweight background helper for quickly opening Kanban catalogue
images.

Select a material / part number anywhere (ERP, Excel, email, etc.)\
Press **Alt + K**\
If an image with the same filename exists in the Kanban catalogue, it
opens instantly.

------------------------------------------------------------------------

## ✨ Features

-   Global hotkey: `Alt + K`
-   Works from any application
-   Preserves clipboard content
-   Shows notification if:
    -   No text is selected
    -   Image does not exist
-   Supports multiple image formats (`.jpg`, `.png`, `.jpeg`)
-   Versioned for maintainability

------------------------------------------------------------------------

## 📦 Requirements

-   Windows
-   AutoHotkey v2

Install AutoHotkey via:

``` bash
winget install --id AutoHotkey.AutoHotkey -e
```

------------------------------------------------------------------------

## 🚀 Usage

1.  Select a material / part number
2.  Press **Alt + K**
3.  The matching image will open (if found)

------------------------------------------------------------------------

## 📁 Catalogue Location

The script currently looks for images in:

O:\_PRODUCTION\LOGISTICS\SUPPLY ORDER SYSTEM\FOTO z katalogů_s duplikáty

Images must match the selected text exactly (filename without
extension).

Example:

Selected text: 123456

File must exist as: 123456.jpg

(also supports `.png` and `.jpeg`)

------------------------------------------------------------------------

## 🛠 Versioning

The version is defined inside the script:

``` ahk
VERSION := "1.0.0"
```

Versioning scheme: 
- Patch: `1.0.1` -- small fixes 
- Minor: `1.1.0` --new features 
- Major: `2.0.0` -- breaking changes

------------------------------------------------------------------------

## 👤 Maintenance

Developed and maintained by **JKA**.  
For internal company use. Managed through GitHub for version control and controlled distribution.
