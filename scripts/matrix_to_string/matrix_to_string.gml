function vec_to_string(_vec)
{
    var _string = "[";
    
    var _length = array_length(_vec);
    var _i = 0;
    repeat(_length)
    {
        _string += string_format(_vec[_i], 0, 5);
        
        ++_i;
        
        if (_i < _length)
        {
            _string += ", ";
        }
    }
    
    return _string + "]";
}