
Submodule ( statistical_data_mod ) statistical_median_smod
!
  Use kind_parameters_mod
  Use quick_sort_data_mod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Median
!
     Type ( Quick_Sort_Data )                    :: QS
     Real(KIND=rkind), Allocatable, Dimension(:) :: xcopy
     If ( Size(this%data) .ne. 0 ) Then
        Allocate ( xcopy(Size(this%data)), source=this%data )
        Call QS%sort_data ( xcopy )
        If ( mod(Size(this%data),2) .eq. 0 ) Then
           median = ( xcopy(Size(this%data)/2) + xcopy(Size(this%data)/2+1) ) / 2.0_rkind
        Else
           median = xcopy(Size(this%data)/2+1)
        End If
        Deallocate ( xcopy )
     Else
        median = Huge ( median )
     End If
     this%median = median
     this%Dmedian = .true.
!
  End Procedure Statistical_Median
!
End Submodule statistical_median_smod
