
import Scanner;

class DocumentProcessor {

  static <T extends Set> T<String> getChunks(List<String> words, int chunkLen) {
    T chunks = new T();
    getChunks(chunks, words, chunkLength);
    return chunks;
  }

  static void getChunks(Set<String> chunks, List<String> words, int chunkLen) {
    for (int firstWordIndex = 0; firstWordIndex < chunkLen; i++) {
      ListIterator iterator = wordList.listIterator(firstWordIndex);
      while (iterator.hasNext()) {
        String curWord = "";
        for (int i = 0; iterator.hasNext() && i < chunkLen; i++)
          curWord += iterator.next() + " ";
        chunks.add(curWord.trim());
      }
    }
  }

  static <T extends List> T<String> getWords(String filename) {
    T words = new T();
    getWords(words, filename);
    return words;
  }

  static void getWords(List<String> words, String filename) {
    Scanner scanner = new Scanner(filename);
    while (scanner.hasNext())
      words.add(scanner.next());
  }

}
