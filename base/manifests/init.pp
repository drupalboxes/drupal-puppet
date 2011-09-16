
class base {
  include base::el::repos::ius, base::el::repos::drupalboxes
  realize (Repos::Yum['base/el/repos/ius'], Repos::Yum['base/el/repos/drupalboxes'])
}