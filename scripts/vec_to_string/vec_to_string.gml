function matrix_to_string(_matrix)
{
    return "[" +
           string_format(_matrix[ 0], 0, 5) + ", " +
           string_format(_matrix[ 1], 0, 5) + ", " +
           string_format(_matrix[ 2], 0, 5) + ", " +
           string_format(_matrix[ 3], 0, 5) + ",\n" +
           string_format(_matrix[ 4], 0, 5) + ", " +
           string_format(_matrix[ 5], 0, 5) + ", " +
           string_format(_matrix[ 6], 0, 5) + ", " +
           string_format(_matrix[ 7], 0, 5) + ",\n" +
           string_format(_matrix[ 8], 0, 5) + ", " +
           string_format(_matrix[ 9], 0, 5) + ", " +
           string_format(_matrix[10], 0, 5) + ", " +
           string_format(_matrix[11], 0, 5) + ",\n" +
           string_format(_matrix[12], 0, 5) + ", " +
           string_format(_matrix[13], 0, 5) + ", " +
           string_format(_matrix[14], 0, 5) + ", " +
           string_format(_matrix[15], 0, 5) + "]";
}