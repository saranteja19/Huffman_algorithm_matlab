# Huffman_algorithm_matlab
**Project Title: Huffman Coding Implementation for Text Compression**

**Project Overview:**
In this project, I implemented the Huffman coding algorithm using MATLAB to achieve efficient text compression and decompression. The objective was to develop a data compression technique that assigns variable-length codes to characters in a text document, with shorter codes for more frequent characters, ultimately reducing the overall storage or transmission size.

**Project Components:**

1. **saran.txt** (Sample Text):
   - A text document used as the source data for compression and decompression. In this project, the Ford Torino automotive description was used as an example text.

2. **HUFmain.m** (Main Program):
   - The `HUFmain` script serves as the project's main program, responsible for orchestrating the compression and decompression processes.
   - It imports the text data from the "saran.txt" file and performs both Huffman encoding and decoding.

3. **huffmannEncoder.m**:
   - The `huffmannEncoder` function encodes the input text using the Huffman coding algorithm.
   - It computes the probability of each character, constructs a Huffman tree, and generates a mapping table that associates characters with their respective Huffman codes.
   - The encoded data is converted into binary bits for efficient storage and transmission.

4. **huffmannDecoder.m**:
   - The `huffmannDecoder` function decodes the Huffman-encoded binary bits using the Huffman tree and mapping table.
   - It processes the binary bits one by one, reconstructing the original text by matching the binary sequences to characters based on the mapping table.

**Technologies and Techniques Employed:**
- MATLAB programming for algorithm implementation.
- Huffman coding for text compression and decompression.
- Probability distribution analysis for character frequencies.
- Binary bit manipulation for encoding and decoding.

**Key Achievements:**
- Successfully implemented the Huffman coding algorithm for text compression and decompression.
- Developed a MATLAB-based solution capable of efficiently reducing the storage or transmission size of textual data.
- Demonstrated proficiency in data compression techniques and algorithmic implementations.

This project showcases my expertise in data compression, algorithm design, and MATLAB programming, which can be valuable assets to highlight on my resume, particularly in roles requiring proficiency in data processing and efficient storage solutions.
