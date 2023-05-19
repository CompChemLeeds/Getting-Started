! This is a program that will hopefully demonstrate the basic ideas of coding in Fortran 90
! This is a comment line
! This is another comment line
! I will show you how to use modules and subroutines and functions
! I will also show you how to use arrays and loops
! I will also show you how to use if statements and do while loops
! I will also show you how to use the read and write statements
! I will also show you how to use the open and close statements
! I will also show you how to use the allocate and deallocate statements
! I will also show you how to use the stop statement
! I will also show you how to use the call statement
! I will also show you how to use the use statement
! I will also show you how to use the implicit none statement
! I will also show you how to use the intent statement
! I will also show you how to use the contains statement
! I will also show you how to use the exit statement
! I will also show you how to use the cycle statement



program EXAMPLE !

    use module_example2 ! This is how you use a module this one is called module_example2
    use module_example ! This is how you use a module this one is called module_example

    implicit none ! This is how you use the implicit none statement. It is used to make sure that you declare all variables 
                  ! before you use them. This is a good practice to get into.

    integer :: i ! This is how you declare a variable. This one is called i and it is an integer
    integer :: j ! This is how you declare a variable. This one is called j and it is an integer
    integer :: k,l ! This is how you declare two (or more) variables of the same type. These ones are called k and l and they are integers

    real :: x ! This is how you declare a variable. This one is called x and it is a real
    real :: y ! This is how you declare a variable. This one is called y and it is a real

    real, dimension(10) :: z ! This is how you declare a variable. This one is called z and it is a real array of size 10

    character(len=10) :: string ! This is how you declare a variable. This one is called string and it is a character array of size 10
    character(len=30) :: string2
    integer, dimension(10) :: a ! This is how you declare a variable. This one is called a and it is an integer array of size 10

    integer, dimension(10,10) :: b ! This is how you declare a variable. This one is called b and it is an integer array of size 10x10

    integer, dimension(10,10,10) :: c ! This is how you declare a variable. This one is called c and it is an integer array of size 10x10x10

    real, dimension(:), allocatable :: d ! This is how you declare a variable. This one is called d and it is an integer array 
                                             ! that can be allocated later

    real, dimension(:,:), allocatable :: e ! This is how you declare a variable. This one is called e and it is an integer array
                                                 ! that can be allocated later

    integer, dimension(:,:,:), allocatable :: f ! This is how you declare a variable. This one is called f and it is an integer array
                                                    ! that can be allocated later
    integer, dimension(:), allocatable :: g ! This is how you declare a variable. This one is called g and it is an integer array
                                             ! that can be allocated later

    
    type(mytype):: example_type ! This is how you declare a variable. This one is called mytype and it is a type called t_mytype
    type(mytype),dimension(:),allocatable:: example_type_array ! This is how you declare a variable. This one is called mytype and it is a type called t_mytype
                                                                ! that can be allocated later
    integer::ierr 



    i=1 ! This is how you assign a value to a variable. This one is called i and it is an integer and it is equal to 1
    j=2 ! This is how you assign a value to a variable. This one is called j and it is an integer and it is equal to 2
    k=3 ! This is how you assign a value to a variable. This one is called k and it is an integer and it is equal to 3
    l=4 ! This is how you assign a value to a variable. This one is called l and it is an integer and it is equal to 4

    x=1.0 ! This is how you assign a value to a variable. This one is called x and it is a real and it is equal to 1.0
    y=2.0 ! This is how you assign a value to a variable. This one is called y and it is a real and it is equal to 2.0

    z(1)=1.0 ! This is how you assign a value to a variable. This one is called z and it is a real array of size 10 and it is equal to 1.0

    string='Hello' ! This is how you assign a value to a variable. This one is called string and it is a character array of size 10 and it is equal to 'Hello'

    a(1)=1 ! This is how you assign a value to a variable. This one is called a and it is an integer array of size 10 and it is equal to 1

    b(1,1)=1 ! This is how you assign a value to a variable. This one is called b and it is an integer array of size 10x10 and it is equal to 1

    c(1,1,1)=1 ! This is how you assign a value to a variable. This one is called c and it is an integer array of size 10x10x10 and it is equal to 1

    allocate(d(10)) ! This is how you allocate an array. This one is called d and it is an integer array of size 10

    allocate(e(10,10)) ! This is how you allocate an array. This one is called e and it is an integer array of size 10x10x10

    allocate(f(10,10,10)) ! This is how you allocate an array. This one is called f and it is an integer array of size 10x10x10

    allocate(g(10)) ! This is how you allocate an array. This one is called g and it is an integer array of size 10

    print*, 'This is a print statement' ! This is how you print a statement. This one prints 'This is a print statement'
    print*, 'This is another print statement which also has a vriable x ', x ! This is how you print a statement. This one prints 'This is another print statement which also has a vriable x ' and then the value of x

    write(*,*) 'This is a write statement' ! This is how you write a statement. This one writes 'This is a write statement'

    print*,"***************************************"

    !This is a do loop statement. It will loop over the values of i from 1 to 10
    do i=1,10
        print*, 'This is a print statement inside a do loop. The value of i is ', i ! This is how you print a statement. This one prints 'This is a print statement inside a do loop. The value of i is ' and then the value of i
    end do ! This is how you end a do loop

    print*,"***************************************"
    !This is a do loop statement. We will use it to fill the values 1 to 10 into the array a
    do i=1,10
        a(i)=i ! This is how you assign a value to a variable. This one is called a and it is an integer array of size 10 and it is equal to i
    end do ! This is how you end a do loop

    print*,"***************************************"

    !This is a if statement that will check if the value of i is equal to 1
    if(i==1) then ! This is how you start an if statement. This one checks if i is equal to 1
        print*, 'The value of i is 1' ! This is how you print a statement. This one prints 'The value of i is 1'
    else ! This is how you start an else statement. This one is executed if the if statement is not true
        print*, 'The value of i is not 1' ! This is how you print a statement. This one prints 'The value of i is not 1'
        print*, 'The value of i is ', i ! This is how you print a statement. This one prints 'The value of i is ' and then the value of i
        print*, 'See how the value of is the final value it took in the previous do loop' ! This is how you print a statement. This one prints 'See how the value of is the final value it took in the previous do loop
    end if ! This is how you end an if statement

    print*,"***************************************"
    !This is a while loop statement. It will loop over the values of i from 1 to 10
    i=1 ! This is how you assign a value to a variable. This one is called i and it is an integer and it is equal to 1
    do while(i<=10) ! This is how you start a while loop. This one loops while i is less than or equal to 10
        print*, 'This is a print statement inside a while loop. The value of i is ', i ! This is how you print a statement. This one prints 'This is a print statement inside a while loop. The value of i is ' and then the value of i
        i=i+1 ! This is how you assign a value to a variable. This one is called i and it is an integer and it is equal to i+1
    end do ! This is how you end a while loop

    print*,"***************************************"
    !This is a nested do loop statement. It will loop over the values of i from 1 to 10 and the values of j from 1 to 10
    do i=1,10
        do j=1,10
            print*, 'This is a print statement inside a nested do loop. The value of i is ', i, ' and the value of j is ', j ! This is how you print a statement. This one prints 'This is a print statement inside a nested do loop. The value of i is ' and then the value of i and then ' and the value of j is ' and then the value of j
        end do ! This is how you end a do loop
    end do ! This is how you end a do loop

    !This is how you use a function that takes two arguements and adds them together and returns the result
    print*,"***************************************"
    print*, 'The sum of 1 and 2 is ', funct_add(7,8) ! This is how you print a statement. This one prints 'The sum of 1 and 2 is ' and then the value of funct_add(7,8)

    print*,"***************************************"
    !We will now use this function but use two variables 
    i=17
    j=18 

    print*, 'The sum of i and j is ', funct_add(i,j) ! This is how you print a statement. This one prints 'The sum of i and j is ' and then the value of funct_add(i,j)

    !We will now write a subroutine that takes two arrays as arguments and adds each row of the array together and places the result in to the second array

    !We will first fill the arrays with some values
    do i=1,10
        do j=1,10
            e(i,j)=i+j ! This is how you assign a value to a variable. This one is called e and it is an integer array of size 10x10 and it is equal to i+j
        end do ! This is how you end a do loop
    end do ! This is how you end a do loop

    call row_adder(e,d) ! This is how you call a subroutine. This one is called row_adder and it takes 2 arguments. The first is an array and the second is an array
                       ! The subroutine is defined in the file module_example.f90

    do i=1,10
        print*, d(i) ! This is how you print a statement. This one prints the value of d(i)
    end do ! This is how you end a do loop

    print*,"***************************************"

    !we will now look at cycle and exit statements
    do i=1,10
        if(i==5) cycle ! This is how you start an if statement. This one checks if i is equal to 5. If it is then it will go back to the start of the do loop
        print*, 'The value of i is ', i ! This is how you print a statement. This one prints 'The value of i is ' and then the value of i
    end do ! This is how you end a do loop

    print*,"***************************************"

    do i=1,10
        if(i==5) exit ! This is how you start an if statement. This one checks if i is equal to 5. If it is then it will exit the do loop
        print*, 'The value of i is ', i ! This is how you print a statement. This one prints 'The value of i is ' and then the value of i
    end do ! This is how you end a do loop
    print*,"***************************************"

   ! Now to deallocate the arrays
    deallocate(d) ! This is how you deallocate an array. This one is called d
    deallocate(e) ! This is how you deallocate an array. This one is called e
    deallocate(f) ! This is how you deallocate an array. This one is called f
    deallocate(g) ! This is how you deallocate an array. This one is called g

    print*,num_of_vars
    print*,num_of_vars2
    ! We will now call the subroutine intialise 
    call initialise() ! This is how you call a subroutine. This one is called initialise and it takes no arguments
    !Let's print the global variables we declared in the moduel module_example2.f90
    print*,num_of_vars
    print*,num_of_vars2
    print*,"***************************************"
    !We will now call the subroutine intialise_mytype which will set up the type mytype

    call initialise_mytype(example_type,5,7.0) ! This is how you call a subroutine

    call read_vals(example_type)

    print*,example_type%r ! This is how you print a statement. This one prints the value of example_type%r
    do i=1,example_type%length ! This is how you start a do loop. This one loops from 1 to the value of example_type%length
        print*,example_type%a(i) ! This is how you print a statement. This one prints the value of example_type%a(i)
    end do
    !We will call the subroutine my_type_array_initialise which will set up the type mytype_array
    
    print*,"***************************************"
    ierr=0
    allocate(d(2),stat=ierr) 
    if(ierr/=0) stop 'Cannot allocate d' ! This is how you check if an array has been allocated correctly and the stop the program if it has not
    d(1)=14.77
    d(2)=-0.03
    call my_type_array_initialise(example_type_array,2,5,d) ! This is how you call a subroutine
    
    print*,example_type_array(1)%r
    print*,example_type_array(2)%r
    print*,"***************************************"
    !We will now call a subroutine to read in the my_type_array_values 

    string2='example_type_array_values.csv'
    call read_vals_array(example_type_array,string2)

    do i=1,2 ! This is how you start a do loop. This one loops from 1 to 2
        do j=1,5 ! This is how you start a do loop. This one loops from 1 to 5
            print*,example_type_array(i)%a(j) ! This is how you print a statement. This one prints the value of example_type_array(i)%a(j)
        end do
        print*,example_type_array(i)%a ! This is how you print a statement. This one prints the value of example_type_array(i)%a
    end do

    !We will now write to a new file called example_type_array_values2.csv

    call write_vals_array(example_type_array,'example_type_array_values2.csv')

    !Now let's deallocate our arrays and variables 
    call deallocate_mytype(example_type)
    call deallocate_mytype_array(example_type_array)

    deallocate(d) ! This is how you deallocate an array. This one is called d

    stop
    
end program EXAMPLE ! This is how you end a program. This one is called EXAMPLE