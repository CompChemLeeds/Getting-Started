MODULE module_example

    use module_example2 !Notice the use of the use statement this ensures everything in module_example2 is available in module_example

    contains


    integer function funct_add(a,b)
        implicit none !Notice the use of the implicit none statement
        integer, intent(in) :: a,b !Notice the use of the intent statement
        funct_add = a + b !Notice the use of the function name as the return value
    end function funct_add

    subroutine row_adder(e,d) 
        implicit none
        real, dimension(:,:),intent(in) :: e !Notice the use of the intent statement
        real, dimension(:), intent(inout) :: d !Notice the use of the intent statement

        integer:: i,j 

        do i=1,size(e,1) !Notice the use of the size function
            d(i) = 0
            do j=1,size(e,2)
                d(i) = d(i) + e(i,j)
            end do
        end do
      
        return !Notice the use of the return statement 

    end subroutine row_adder

    subroutine initialise_mytype(example_type,length,b)

        implicit none
        type(mytype), intent(inout) :: example_type
        integer, intent(in) :: length
        real,intent(in):: b

        integer:: ierr 
        ierr=0
        allocate(example_type%a(length),stat=ierr)

        if(ierr/=0) then 
            errorflag = 1 
            write(6,"(a,i0)") "error allocating mytype%a. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
                                                                         
        end if

        example_type%r = b !This sets mytype value to b
        example_type%length = length

        return

    end subroutine initialise_mytype

    subroutine deallocate_mytype(example_type)

        implicit none
        type(mytype), intent(inout) :: example_type
        integer:: ierr

        deallocate(example_type%a,stat=ierr)
        if(ierr/=0) then 
            errorflag = 1 
            write(6,"(a,i0)") "error deallocating mytype%a. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
                                                                         
        end if

        return

    end subroutine deallocate_mytype

    subroutine read_vals(example_type)

        implicit none

        type(mytype), intent(inout) :: example_type
        integer:: i,ierr

        ierr = 0 

        open(unit=5,file="variables.dat",status="old",iostat=ierr) !Notice the use of the open statement and the iostat statement
                                                                !Notice the use of the unit statement to specify the unit number
        if(ierr/=0) then 
            errorflag = 1 
            write(6,"(a,i0)") "error allocating mytype%a. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
                                                                         
        end if

        do i=1,example_type%length
            read(5,*) example_type%a(i)
        end do

        close(5) !Notice the use of the close statement this closes the file

        return

    end subroutine read_vals

    subroutine my_type_array_initialise(example_type_array,length,arr_length,b)

        implicit none
        type(mytype), dimension(:), allocatable, intent(inout) :: example_type_array
        integer, intent(in) :: length,arr_length
        real,dimension(:),intent(in):: b

        integer:: i,ierr 

        if(errorflag/=0) return !Notice the use of the return statement. This returns the subroutine if errorflag is not equal to zero 

        ierr =0 
        allocate(example_type_array(length),stat=ierr)  !Notice the use of the allocate statement
        if(ierr/=0) then 
            errorflag = 1 
            write(6,"(a,i0)") "error allocating array of mytype. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers                                                           
        end if

        do i=1,length
            call initialise_mytype(example_type_array(i),arr_length,b(i))
        end do

        return

    end subroutine my_type_array_initialise

    subroutine read_vals_array(example_type_array,string2)

        implicit none
        type(mytype), dimension(:), intent(inout) :: example_type_array
        character(len=*),intent(in):: string2
        integer:: i,ierr

        ierr=0
        open(unit=10,file=trim(string2),status="old",iostat=ierr) !Notice the use of the open statement and the iostat statement
                                                                !Notice the use of the unit statement to specify the unit number

        if(ierr/=0) then
            errorflag = 1
            write(6,"(a,i0)") "error opening file. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
        end if

        do i=1,size(example_type_array) !Loop over the size of the my_type array 
            read(10,*) example_type_array(i)%a
        end do

        close(10) !Notice the use of the close statement this closes the file

        return

    end subroutine read_vals_array

    subroutine write_vals_array(example_type_array,string)

        implicit none 

        type(mytype), dimension(:), intent(in) :: example_type_array
        character(len=*),intent(in):: string
        integer:: i,ierr

        ierr=0 

        open(unit=11,file=string,status="unknown",iostat=ierr) !Notice the use of the open statement and the iostat statement
                                                                !Notice the use of the unit statement to specify the unit number

        if(ierr/=0) then
            errorflag = 1
            write(6,"(a,i0)") "error opening file. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
        end if

        do i=1,size(example_type_array) !Loop over the size of the my_type array 
            write(11,*) example_type_array(i)%a
        end do

        close(11) !Notice the use of the close statement this closes the file

        return

    end subroutine write_vals_array

    subroutine deallocate_mytype_array(example_type_array)

        implicit none
        type(mytype), dimension(:), allocatable, intent(inout) :: example_type_array
        integer:: i,ierr

        ierr=0

        do i=1,size(example_type_array)
            call deallocate_mytype(example_type_array(i))
        end do

        deallocate(example_type_array,stat=ierr)
        if(ierr/=0) then 
            errorflag = 1 
            write(6,"(a,i0)") "error deallocating array of mytype. ierr = ", ierr !Notice the use of the write statement the a and i0 are format specifiers 
                                                                         !Notice the use of the comma to separate the format specifiers
                                                                         
        end if

        return

    end subroutine deallocate_mytype_array


end module module_example

