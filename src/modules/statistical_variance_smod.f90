Submodule ( statistical_data_mod ) statistical_variance_smod
!
  Use kind_parameters_mod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Variance
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
        variance = Sum ( (this%data-mn)**2 ) / Size ( this%data )
     Else
        variance = Huge ( variance )
     End If
     this%variance = variance
     this%Dvariance = .true.
!
  End Procedure Statistical_Variance
!
End Submodule statistical_variance_smod
