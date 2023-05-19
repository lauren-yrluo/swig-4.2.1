// This testcase checks SWIG's support for `auto` as the return type of a
// function with no trailing return type, introduced in C++14.
%module cpp14_auto_return_type

// SWIG can't deduce the return type, so we ignore the `auto`-using declaration
// (which would typically be in a header being wrapped) and provide a
// declaration with an explicit return type in the interface file.

namespace teca_variant_array_util {
int va_static_cast();
%ignore va_static_cast();
}
#pragma SWIG nowarn=SWIGWARN_CPP14_AUTO

%inline %{
namespace teca_variant_array_util
{
// Parse error in SWIG < 4.2.0.
auto va_static_cast()
{
    return 42;
}
}
%}