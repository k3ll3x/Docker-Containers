import hashlib
from mcp.server.fastmcp import FastMCP

# Initialize FastMCP server
mcp = FastMCP("md5hash")

@mcp.tool()
def generate_md5_hash(input_str: str) -> str:
    # Create an md5 hash object
    md5_hash = hashlib.md5()
    # Update the hash object with the bytes of the input string
    md5_hash.update(input_str.encode('utf-8'))
    # Return the hexadecimal representation of the digest
    return md5_hash.hexdigest()

@mcp.tool()
def count_characters(input_str: str) -> int:
    # Count number of characters in the input string
    return len(input_str)


@mcp.tool()
def get_first_half(input_str: str) -> str:
    # Calculate the midpoint of the string
    midpoint = len(input_str) // 2
    # Return the first half of the string
    return input_str[:midpoint]


if __name__ == "__main__":
    # Initialize and run the server
    mcp.run(transport='stdio')
