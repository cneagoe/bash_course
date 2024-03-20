# book summary exercise
# create a git directory called books 
# download https://raw.githubusercontent.com/asweigart/codebreaker/master/frankenstein.txt in this directory
# 1. Add a new function to your script that takes the text from the book as a string, and returns the number of words in the string.
# 2. Add a new function to your script that takes the text from the book as a string, and returns the number of times each character appears in the string. 
#    Convert any uppercase letters to lowercase letters, we don't want duplicates.
# 3. Create a report that looks like the one bellow
# --- Begin report of books/frankenstein.txt ---
# 77986 words found in the document

# The 'e' character was found 46043 times
# The 't' character was found 30365 times
# The 'a' character was found 26743 times
# The 'o' character was found 25225 times
# The 'i' character was found 24613 times
# The 'n' character was found 24367 times
# The 's' character was found 21155 times
# The 'r' character was found 20818 times
# The 'h' character was found 19725 times
# The 'd' character was found 16863 times
# The 'l' character was found 12739 times
# The 'm' character was found 10604 times
# The 'u' character was found 10407 times
# The 'c' character was found 9243 times
# The 'f' character was found 8731 times
# The 'y' character was found 7914 times
# The 'w' character was found 7638 times
# The 'p' character was found 6121 times
# The 'g' character was found 5974 times
# The 'b' character was found 5026 times
# The 'v' character was found 3833 times
# The 'k' character was found 1755 times
# The 'x' character was found 677 times
# The 'j' character was found 504 times
# The 'q' character was found 324 times
# The 'z' character was found 243 times
# --- End report ---

def main():
    book_path = "books/frankenstein.txt"
    text = get_book_text(book_path)
    num_words = get_num_words(text)
    chars_dict = get_chars_dict(text)
    chars_sorted_list = chars_dict_to_sorted_list(chars_dict)

    print(f"--- Begin report of {book_path} ---")
    print(f"{num_words} words found in the document")
    print()

    for item in chars_sorted_list:
        if not item["char"].isalpha():
            continue
        print(f"The '{item['char']}' character was found {item['num']} times")

    print("--- End report ---")


def get_num_words(text):
    words = text.split()
    return len(words)


def sort_on(d):
    return d["num"]


def chars_dict_to_sorted_list(num_chars_dict):
    sorted_list = []
    for ch in num_chars_dict:
        sorted_list.append({"char": ch, "num": num_chars_dict[ch]})
    sorted_list.sort(reverse=True, key=sort_on)
    return sorted_list


def get_chars_dict(text):
    chars = {}
    for c in text:
        lowered = c.lower()
        if lowered in chars:
            chars[lowered] += 1
        else:
            chars[lowered] = 1
    return chars


def get_book_text(path):
    with open(path) as f:
        return f.read()


main()
