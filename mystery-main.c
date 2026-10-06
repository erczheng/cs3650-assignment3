// Provided by libmystery.a
long crunch(long a, long b);

int main(int argc, char *argv[]) {
  // Need exactly two arguments (plus program name)
  if (argc != 3) {
    puts("Two arguments required.");
    return 1;
  }

  // Convert arguments from strings to longs
  long a = atol(argv[1]);
  long b = atol(argv[2]);

  // Call the mystery function
  long result = crunch(a, b);

  // Print based on the sign of the result
  if (result < 0) {
    puts("hat");
  } else if (result == 0) {
    puts("tea");
  } else {
    puts("beer");
  }

  return 0;
}
