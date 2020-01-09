Submodule (statistical_data_mod) statistical_accessors_smod
!
  Implicit None
!
Contains
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Module Procedure set_data
     If ( Allocated ( this%data ) ) Then
        Error Stop "set_data: Data Vector already allocated"
     End If
     Allocate ( this%data(Size(array)), source = array )
  End Procedure set_data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Module Procedure clear_data
     If ( Allocated ( this%data ) ) Then
        Deallocate ( this%data )
     Else
        Error Stop "clear_data: Data Vector was not allocated"
     End If
  End Procedure clear_data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Module Procedure get_elemental_data
     data = this%data(d)
  End Procedure get_elemental_data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
  Module Procedure get_array_data
     data = this%data
  End Procedure get_array_data
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
End Submodule statistical_accessors_smod
