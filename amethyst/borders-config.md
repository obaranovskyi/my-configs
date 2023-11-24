# Green color

```bash
borders active_color=0xff32a879 inactive_color=0xff494d64 width=10.0
```

# Violet 
```bash
borders active_color=0xFFBE9CFF inactive_color=0xff494d64 width=10.0
# dark
borders active_color=0xFF8D49FF inactive_color=0xff494d64 width=10.0
```

# Red
```bash
borders active_color=0xFFB30000 inactive_color=0xff494d64 width=10.0
```

# Pink
```bash
borders active_color=0xFF82003F inactive_color=0xff494d64 width=10.0
# lighter
borders active_color=0xFFB30458 inactive_color=0xff494d64 width=10.0
```

```python
def hex_to_0xAARRGGBB(hex_color):
    # Remove the '#' symbol if present
    hex_color = hex_color.lstrip('#')

    # Convert the hex values to integers
    red = int(hex_color[0:2], 16)
    green = int(hex_color[2:4], 16)
    blue = int(hex_color[4:6], 16)

    # Set the alpha channel to fully opaque (0xFF)
    alpha = 0xFF

    # Create the 32-bit format
    result = (alpha << 24) | (red << 16) | (green << 8) | blue

    return result

# Example usage
hex_color_code = "#b30458"
result = hex_to_0xAARRGGBB(hex_color_code)
print("Hex Color Code:", hex_color_code)
print("Converted Value:", hex(result))
```

