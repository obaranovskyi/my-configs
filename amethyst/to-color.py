def hex_to_0xAARRGGBB(hex_color):
    hex_color = hex_color.lstrip('#')
    red = int(hex_color[0:2], 16)
    green = int(hex_color[2:4], 16)
    blue = int(hex_color[4:6], 16)
    alpha = 0xFF
    result = (alpha << 24) | (red << 16) | (green << 8) | blue
    return result

# Example usage
hex_color_code = "#b30458"
result = hex_to_0xAARRGGBB(hex_color_code)
print("Hex Color Code:", hex_color_code)
print("Converted Value:", hex(result))
