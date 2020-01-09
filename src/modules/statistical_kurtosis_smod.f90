Submodule ( statistical_data_mod ) statistical_kurtosis_smod
!
  Use kind_parameters_mod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Kurtosis
!
    Real(KIND=rkind) :: mn, sd
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
       If ( Present ( std_dev ) ) Then
          sd = std_dev
       Else
          If ( this%Dstd_dev ) Then
             sd = this%std_dev
          Else
             sd = Statistical_Std_Dev ( this, mn )
          End If
       End If
       If ( sd .ne. 0.0d0 ) Then
          kurtosis = Sum ( (this%data-mn)**4 ) / Size ( this%data ) / sd**4 - 3.0_rkind
       Else
          kurtosis = Huge ( kurtosis )
       End If
    Else
       kurtosis = Huge ( kurtosis )
    End If
    this%kurtosis = kurtosis
    this%Dkurtosis = .true.
!
  End Procedure Statistical_Kurtosis
!
End Submodule statistical_kurtosis_smod
