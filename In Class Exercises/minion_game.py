def minion_game(string):
    a_name = 'Stuart'
    b_name = 'Kevin'

    vowels = ['A', 'E', 'I', 'O', 'U']


    a_words = [string[i:j] for i in range(len(string)) for j in range(i + 1, len(string) + 1) if string[i] not in vowels]
    b_words = [string[i:j] for i in range(len(string)) for j in range(i + 1, len(string) + 1) if string[i] in vowels]


    a_score = len(a_words)
    b_score = len(b_words)


    if a_score > b_score:
        print(f"{a_name} wins with a score of {a_score}!")
    elif b_score > a_score:
        print(f"{b_name} wins with a score of {b_score}!")
    else:
        print("It's a tie!")


word = input("Enter the word: ").upper()


minion_game(word)
