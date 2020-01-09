Program test
!
  Use kind_parameters_mod
  Use statistical_data_mod
!
  Implicit None
!
  Integer(KIND=ikind), Parameter :: n=100000
  Integer(KIND=ikind) :: i
  Real(KIND=rkind), Parameter :: pi = 4.0_rkind * atan( 1.0_rkind )
  Real(KIND=rkind) :: mean, std_dev, temp
  Real(KIND=rkind), Dimension(n) :: data
  Type ( Statistical_Data ) :: a
!
!  Real(KIND=rkind), Parameter :: expt_median   = ???_rkind
  Real(KIND=rkind), Parameter :: expt_mean     = +4.99727900261068E+000_rkind
  Real(KIND=rkind), Parameter :: expt_variance = +0.161102392359480E+000_rkind
  Real(KIND=rkind), Parameter :: expt_std_dev  = +0.401375625019109E+000_rkind
  Real(KIND=rkind), Parameter :: expt_skewness = +4.793986905935477E-004_rkind
  Real(KIND=rkind), Parameter :: expt_kurtosis = -1.321972598442045E-002_rkind
!
  Real(KIND=rkind), Parameter :: tolerance = 1.0E-08_rkind
!
  mean = 5.0
  std_dev = 0.4
  Call RANDOM_NUMBER ( data )
  DO i = 1, n-1, 2
     temp = std_dev * SQRT(-2.0_rkind*LOG(data(i))) * COS(2_rkind*pi*data(i+1)) + mean
     data(i+1) = std_dev * SQRT(-2.0_rkind*LOG(data(i))) * SIN(2_rkind*pi*data(i+1)) + mean
     data(i) = temp
  END DO
!
  Call a%set_data ( data )
!
!  If ( absolute_error ( expt_median,   a%get_median()   ) > tolerance ) Error Stop "Incorrect Median"
  If ( absolute_error ( expt_mean,     a%get_mean()     ) > tolerance ) Error Stop "Incorrect Mean"
  If ( absolute_error ( expt_variance, a%get_variance() ) > tolerance ) Error Stop "Incorrect Variance"
  If ( absolute_error ( expt_std_dev,  a%get_std_dev()  ) > tolerance ) Error Stop "Incorrect Std_Dev"
  If ( absolute_error ( expt_skewness, a%get_skewness() ) > tolerance ) Error Stop "Incorrect Skewness"
  If ( absolute_error ( expt_kurtosis, a%get_kurtosis() ) > tolerance ) Error Stop "Incorrect Kurtosis"
!
  Call a%clear_data()
!
  print *,"Test passed."
!
Contains

   Elemental Function absolute_error(expected, actual) Result(abs_err)
     Real(rkind), Intent(In) :: expected, actual
     Real(rkind) :: abs_err
     abs_err = Abs( ( actual - expected )/ expected )
   End Function

End Program test
