Submodule ( statistical_data_mod ) statistical_mean_smod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Mean
!
    If ( Size(this%data) .ne. 0 ) Then
       mean = Sum ( this%data ) / Size ( this%data )
    Else
       mean = Huge ( mean )
    End If
    this%mean = mean
    this%Dmean = .true.
!
  End Procedure Statistical_Mean
!
End Submodule statistical_mean_smod
