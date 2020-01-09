Submodule ( statistical_data_mod ) statistical_skewness_smod
!
  Use kind_parameters_mod
!
  Implicit None
!
Contains
!
  Module Procedure Statistical_Skewness
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
          skewness = Sum ( (this%data-mn)**3 ) / Size ( this%data ) / sd**3
       Else
          skewness = Huge ( skewness )
       End If
    Else
       skewness = Huge ( skewness )
    End If
    this%skewness = skewness
    this%Dskewness = .true.
!
  End Procedure Statistical_Skewness
!
End Submodule statistical_skewness_smod
