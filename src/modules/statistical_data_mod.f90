Module statistical_data_mod
!
  Use kind_parameters_mod
!
  Implicit None
!
  Private
  Public Statistical_Data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Type Statistical_Data
!
     Private
     Real(KIND=rkind), Allocatable, Dimension(:) :: data
     Real(KIND=rkind)                            ::  median,          mean,          variance,          std_dev,          skewness,          kurtosis
     Logical                                     :: Dmedian=.false., Dmean=.false., Dvariance=.false., Dstd_dev=.false., Dskewness=.false., Dkurtosis=.false.
!
  Contains
!
     Procedure :: set_data, clear_data
     Procedure :: get_elemental_data, get_array_data
!
     Procedure, Private :: Statistical_Median
     Procedure, Private :: Statistical_Mean
     Procedure, Private :: Statistical_Variance
     Procedure, Private :: Statistical_Std_Dev
     Procedure, Private :: Statistical_Skewness
     Procedure, Private :: Statistical_Kurtosis
!
     Generic :: get_data     => get_elemental_data, get_array_data
!
     Generic :: get_median   => Statistical_Median
     Generic :: get_mean     => Statistical_Mean
     Generic :: get_variance => Statistical_Variance
     Generic :: get_std_dev  => Statistical_Std_Dev
     Generic :: get_skewness => Statistical_Skewness
     Generic :: get_kurtosis => Statistical_Kurtosis
!
  End Type Statistical_Data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Interface
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
     Module Function Statistical_Median ( this ) Result ( median )
       Implicit None
       Class ( Statistical_Data ) ,Intent(inout) :: this
       Real(KIND=rkind)                          :: median
     End Function Statistical_Median
!
     Module Function Statistical_Mean ( this ) Result ( mean )
       Implicit None
       Class ( Statistical_Data ) ,Intent(inout) :: this
       Real(KIND=rkind)                          :: mean
     End Function Statistical_Mean
!
     Module Function Statistical_Variance ( this, mean ) Result ( variance )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
       Real(KIND=rkind), Optional, Intent(in)    :: mean
       Real(KIND=rkind)                          :: variance
     End Function Statistical_Variance
!
     Module Function Statistical_Std_Dev ( this, mean ) Result ( std_dev )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
       Real(KIND=rkind), Optional, Intent(in)    :: mean
       Real(KIND=rkind)                          :: std_dev
     End Function Statistical_Std_Dev
!
     Module Function Statistical_Skewness ( this, mean, std_dev ) Result ( skewness )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
       Real(KIND=rkind), Optional, Intent(in)    :: mean
       Real(KIND=rkind), Optional, Intent(in)    :: std_dev
       Real(KIND=rkind)                          :: skewness
     End Function Statistical_Skewness
!
     Module Function Statistical_Kurtosis ( this, mean, std_dev ) Result ( kurtosis )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
       Real(KIND=rkind), Optional, Intent(in)    :: mean
       Real(KIND=rkind), Optional, Intent(in)    :: std_dev
       Real(KIND=rkind)                          :: kurtosis
     End Function Statistical_Kurtosis
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
     Module Subroutine set_data ( this, array )
       Implicit None
       Class ( Statistical_Data ),     Intent(inout) :: this
       Real(KIND=rkind), Dimension(:), Intent(in)    :: array
     End Subroutine set_data
!
     Module Subroutine clear_data ( this )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
     End Subroutine clear_data
!
     Module Function get_elemental_data ( this, d ) Result ( data )
       Implicit None
       Class ( Statistical_Data ), Intent(inout) :: this
       Integer(KIND=ikind),        Intent(in)    :: d
       Real   (KIND=rkind)                       :: data
     End Function get_elemental_data
!
     Module Function get_array_data ( this ) Result ( data )
       Implicit None
       Class ( Statistical_Data ), Intent(inout)   :: this
       Real(KIND=rkind), Allocatable, Dimension(:) :: data
     End Function get_array_data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  End Interface
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
End Module statistical_data_mod
