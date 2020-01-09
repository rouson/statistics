Module kind_parameters_mod
!
  Use iso_fortran_env, Only : int32, int64, real32, real64
!
  Implicit None
!
  Private
  Public :: ikind, rkind, sikind
!
! Integer lengeths
!
  Integer, Parameter :: intsp = int32
  Integer, Parameter :: intdp = int64
!
! Real lengths
!
  Integer, Parameter :: realsp = real32
  Integer, Parameter :: realdp = real64
!
! Default integers and reals and special integer
!
  Integer, Parameter :: ikind  = intsp
  Integer, Parameter :: rkind  = realdp
  Integer, Parameter :: sikind = intdp
!
End Module kind_parameters_mod
