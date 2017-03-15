program compare_box_muller

   use mt_stream

   implicit none
   integer, parameter :: PREC = 8
   integer, parameter :: M = 1000
   integer, parameter :: N = 100000
   real(PREC), parameter :: two_pi = 3.14159265358979323846264338 * 2.0e0_PREC
   real(8) :: time_s, time

   integer :: i, j
   real(PREC) :: x, y, r, p, q
   real(PREC) :: s, s1, s2, s3
   real(PREC) :: t1, t2, t3

   type(mt_state) :: mts

   call set_mt19937
   call new(mts)
   call init(mts, 20170315)

   s1 = 0.0
   s2 = 0.0
   s3 = 0.0
   t1 = 0.0
   t2 = 0.0
   t3 = 0.0

   do j = 1, M
      !! Method 1        
      call cpu_time(time_s)
   
      s = 0.0e0_PREC
      do i = 1, N
         do
            x = 2.0e0_PREC * genrand_double1(mts) - 1.0e0_PREC
            y = 2.0e0_PREC * genrand_double1(mts) - 1.0e0_PREC
      
            r = x*x + y*y
            if(r < 1.0e0_PREC .and. r > 0.0e0_PREC) exit
         enddo
      
         r = sqrt(-2.0e0_PREC * log(r) / r)
         p = x * r
         q = y * r
   
         s = s + p + q
      enddo
      call cpu_time(time)
   
      s1 = s1 + s
      t1 = t1 + time - time_s
      !write(*,*) '1 ',s, time
   
      !! Method 2
      call cpu_time(time_s)
   
      s = 0.0e0_PREC
      do i = 1, N
         do
            x = 2.0e0_PREC * genrand_double3(mts) - 1.0e0_PREC
            y = 2.0e0_PREC * genrand_double3(mts) - 1.0e0_PREC
      
            r = x*x + y*y
            if(r < 1.0e0_PREC) exit
         enddo
      
         r = sqrt(-2.0e0_PREC * log(r) / r)
         p = x * r
         q = y * r
   
         s = s + p + q
      enddo
   
      call cpu_time(time)
   
      s2 = s2 + s
      t2 = t2 + time - time_s
      !write(*,*) '2 ',s, time
   
      !! Method 3
      call cpu_time(time_s)
   
      s = 0.0e0_PREC
      do i = 1, N
         x = genrand_double3(mts)
         y = genrand_double3(mts)
   
         p = sqrt(-2.0 * log(x)) * cos(two_pi * y)
         q = sqrt(-2.0 * log(x)) * sin(two_pi * y)
   
         s = s + p + q
      enddo
   
      call cpu_time(time)
   
      s3 = s3 + s
      t3 = t3 + time - time_s
      !write(*,*) '3 ',s, time

   enddo

   write(*,*) '1  ',s1,' ',t1
   write(*,*) '2  ',s2,' ',t2
   write(*,*) '3  ',s3,' ',t3

endprogram compare_box_muller
