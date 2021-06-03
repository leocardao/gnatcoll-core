------------------------------------------------------------------------------
--                              G N A T C O L L                             --
--                                                                          --
--                       Copyright (C) 2021, AdaCore                        --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

with GNATCOLL.OS.Libc.Dirent;
with GNATCOLL.OS.Libc;
with GNATCOLL.String_Builders;
with GNAT.OS_Lib;

separate (GNATCOLL.OS.Dir)
procedure Close (Handle : Dir_Handle) is

   package Dirent renames GNATCOLL.OS.Libc.Dirent;
   package Libc renames GNATCOLL.OS.Libc;

   Status : Libc.Libc_Status;
begin
   Status := Dirent.Closedir (Dirent.Dir_Handle (Handle.Handle));
   if Status /= Libc.Success then
      raise OS_Error with "error while closing directory handle";
   end if;
end Close;
