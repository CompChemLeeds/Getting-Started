MODULE module_example2

    ! This module contains the definition of the type t_mytype
    ! and the definition of the interface of the function f_myfunc

    TYPE mytype
        INTEGER :: length
        REAL    :: r
        REAL, dimension(:),allocatable :: a
    END TYPE mytype

    ! Now to declare some global variables 

    integer:: num_of_vars
    integer:: num_of_vars2
    real(kind=8)::pirl      ! pi the real number is of kind=8 which is double precision
    real(kind=8) :: sqrtpi  ! square root of pi

    integer::errorflag     ! error flag


    contains 

    subroutine initialise

        implicit none 

        num_of_vars=1000
        num_of_vars2=22
        pirl=3.141592653589793238462643383279502884197169399375105820974944592307816406286
        sqrtpi=sqrt(pirl)
        errorflag=0

    end subroutine initialise


End Module module_example2