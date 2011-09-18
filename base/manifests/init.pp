
class base {
  include base::el::repos
          
  Repos::Yum <| title == 'ius' or title == 'epel' or title == 'drupalboxes' |>
}