<!DOCTYPE html>
<?php $informasi = $this->informasi->web(); ?>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>HOME | SIM</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>/assets/select2/css/select2.min.css">
            <script src="<?php echo base_url() ?>template/vendors/jquery/dist/jquery.min.js"></script>

    <script type="text/javascript" src="<?php echo base_url(); ?>/assets/select2/js/select2.min.js"></script>
    <script type="text/javascript">
$(document).ready(function() {
  $(".js-example-basic-single").select2();
});
</script>
    <link rel="shortcut icon" href="<?= base_url($informasi['fav']) ?>" type="image/x-icon">
    <!-- Bootstrap -->
    <link href="<?php echo base_url() ?>template/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<?php echo base_url() ?>template/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="<?php echo base_url() ?>template/build/css/custom.min.css" rel="stylesheet">
    <!-- jQuery -->
    <!-- STOK OBAT START -->
 
<script src="<?= base_url() ?>assets/highcharts/code/highcharts.js"></script>
 <script src="<?= base_url() ?>assets/highcharts/code/modules/exporting.js"></script>
 

  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="<?php echo base_url() ?>" class="site_title">
              <span>Klinik</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_info">
                <h2 class="pull-right">
                 Hai, Selamat datang <?php $user = $this->ion_auth->user()->row();
                     echo $user->first_name." ".$user->last_name; ?>
      
    </h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>MENU UTAMA</h3>
                <ul class="nav side-menu">
                    <li><a href="<?= base_url('auth') ?>"><i class="fa fa-home"></i> BERANDA </a></li>
                    <li><a><i class="fa fa-desktop"></i> Master Data <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="<?= base_url('Users') ?>">User Management</a></li>
                            <li><a href="<?= base_url('Kategori') ?>">Kategori Obat / Paket</a></li>
                            <li><a href="<?= base_url('Barang') ?>">Obat / Paket</a></li>
                            <li><a href="<?= base_url('c_jadwal') ?>">Jadwal</a></li>
                            <li><a href="<?= base_url('k_tindakan') ?>">Tindakan</a></li>
                        </ul>
                    </li>
                        <li><a href="<?= base_url('transaksi') ?>"><i class="fa fa-edit"></i> Kasir</a></li>
                        <li><a href="<?= base_url('K_janji') ?>"><i class="fa fa-table"></i>Janji </a></li>
                  
                        <li><a href="<?= base_url('c_pesan') ?>"><i class="fa fa-envelope"></i>Pesan </a></li>
                        <li><a href="<?= base_url('k_rmedis') ?>"><i class="fa fa-laptop"></i>Rekam Medis </a></li>
                        <li><a href="<?= base_url('transaksi/laporan') ?>"><i class="fa fa-bar-chart-o"></i> Laporan</a></li>

                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="<?= base_url('auth/logout') ?>">
                <span class="glyphicon glyphicon-off" aria-hidden="false"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <?php 
                      if ($this->ion_auth->is_admin())
                        {
                         echo "Administrator";
                        }elseif ($this->ion_auth->in_group("Dokter")) {
                          echo "Dokter";
                        }else{
                          echo "Pasien";
                        }
                     ?>
                    <span class="fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li> <a href="<?= base_url('auth/logout') ?>"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
                <li role="presentation" class="dropdown"><a href="javascript:;" class="dropdown-toggle info-number">
                    <b><?php date_default_timezone_set("Asia/Jakarta"); echo date("H:s"); ?></b> WIB
                  </a></li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
          <div class="clearfix"></div>
          <!-- top tiles -->

                <?php
                echo $contents;
                ?>
              
                <!-- end of weather widget -->
                </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <?= $informasi['name']; ?> ©<?= date("Y"); ?> All Rights Reserved.
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- Bootstrap -->
    <script src="<?php echo base_url() ?>template/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url() ?>template/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->

    <!-- Custom Theme Scripts -->
    <script src="<?php echo base_url() ?>template/build/js/custom.min.js"></script>
        <script src="<?php echo base_url('assets/datatables/jquery.dataTables.js') ?>"></script>
        <script src="<?php echo base_url('assets/datatables/dataTables.bootstrap.js') ?>"></script>


  </body>

</html>
