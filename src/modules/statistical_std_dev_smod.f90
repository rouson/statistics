Submodule ( statistical_data_mod ) statistical_std_dev_smod
!
  Use kind_parameters_mod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Std_Dev
!
    Real(KIND=rkind) :: mn
    If ( Size(this%data) .ne. 0 ) Then
       If ( Present ( mean ) ) Then
          mn = mean
       Else
          If ( this%Dmean ) Then
             mn = this%mean
          Else
             mn = Statistical_Mean ( this )
          End If
       End If
       If ( this%Dvariance ) Then
          std_dev = sqrt ( this%variance )
       Else
          std_dev = Sqrt ( Statistical_Variance ( this, mn ) )
       End If
    Else
       std_dev = Huge ( std_dev )
    End If
    this%std_dev = std_dev
    this%Dstd_dev = .true.
!
  End Procedure Statistical_Std_Dev
!
End Submodule statistical_std_dev_smod
