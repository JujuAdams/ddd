/// Sets the global GPU projection matrix. This function should be called in place of
/// `matrix_set(matrix_projection, matrix)`.
/// 
/// @param projectionMatrix

function ddd_matrix_set_projection(matrix)
{
    static static_matrix = matrix_build_identity();
    
    if (DDD_NORMATIVE_PROJECTION)
    {
        matrix_set(matrix_projection, matrix);
    }
    else
    {
        var new_matrix = static_matrix;
        array_copy(new_matrix, 0, matrix, 0, 16);
        
        new_matrix[@  1] = -new_matrix[ 1];
        new_matrix[@  5] = -new_matrix[ 5];
        new_matrix[@  9] = -new_matrix[ 9];
        new_matrix[@ 13] = -new_matrix[13];
        
        matrix_set(matrix_projection, new_matrix);
    }
}