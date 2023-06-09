using System;

namespace FormValidator
{
    class Program
    {
        static void Main(string[] args)
        {
            FormValidator validator = new FormValidator();

            validator.ValidateForm();

            validator.Close();
        }
    }
}
