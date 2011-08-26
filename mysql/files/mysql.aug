(* MySQL module for Augeas                      *)
(* Author: Raphael Pinson <raphink@gmail.com> *)
(* Patches from: *)
(*   Marc Fournier <marc.fournier@camptocamp.com> *)
(*                                            *)

module MySQL =
  autoload xfm

(************************************************************************
 * INI File settings
 *************************************************************************)

let comment = IniFile.comment IniFile.comment_re IniFile.comment_default
let sep     = IniFile.sep IniFile.sep_re IniFile.sep_default


(* Import useful INI File primitives *)
let eol     = IniFile.eol
let empty   = IniFile.empty
let sto_to_comment = IniFile.sto_to_comment


(************************************************************************
 *                        ENTRY
 * my.cnf allows flag entries
 *************************************************************************)

let entry    = 
      let kw = IniFile.entry_re in
         [ key kw . (sep . sto_to_comment)? . (comment|eol) ] | comment


(************************************************************************
 *                         TITLE
 *
 * /!include(dir)?/ must be excluded from record_re since
 *************************************************************************)

let title       = IniFile.title ( IniFile.record_re - /!include(dir)?/ )
let record      = IniFile.record title entry


(************************************************************************
 *                         INCLUDE
 *
 * !include and !includedir are special entries, which does not belong to any record
 *************************************************************************)

let include = [ key /!include(dir)?/
                 . Util.del_ws_spc . store /([^ \t\n].*[^ \t\n]|[^ \t\n])/
		 . IniFile.eol ]


(************************************************************************
 *                         LENS & FILTER
 *
 * A record is overall either a normal record,
 * or a an !include / !includedir entry followed by optional comments and empty lines
 *************************************************************************)

let record_all = record | ( include . ( comment | empty )* )

let lns        = IniFile.lns record_all comment

let filter = (incl "/etc/mysql/my.cnf" . incl "/etc/mysql/conf.d/*" . incl "/etc/my.cnf")
             . Util.stdexcl

let xfm = transform lns filter

