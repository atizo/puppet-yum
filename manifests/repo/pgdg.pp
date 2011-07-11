class yum::repo::pgdg(
  $priority = 30,
  $includepkgs = 'absent',
  $version = '0.9'
) {
  include yum
  if $version not in ['8.2','8.3','8.4','9.0'] {
    fail("Version '$version' is not supported by PGDG.")
  }
  yum::repo{"PostgreSQL $version $releasever - $basearch":
    descr => 'RPMForge RHEL5 packages',
    baseurl => "http://yum.pgrpms.org/$version/redhat/rhel-$releasever-$basearch",
    priority => $priority,
    includepkgs => $includepkgs,
    enabled => 1,
    gpgcheck => 1,
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG',
  }
}