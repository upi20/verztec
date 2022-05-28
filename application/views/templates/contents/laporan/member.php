
  <div class="card card-info card-outline" id="filter">
    <div class="card-header">
      <div class="container-fluid">
        <div class="d-flex justify-content-end  align-items-star w-100 flex-md-row flex-column">
          <h3 class="card-title align-self-center">Export ke Excel: </h3>
          <div class="form-group  mb-lg-0 ml-lg-2">
            <a type="button" href="<?php echo base_url();?>laporan/member/allMember" class="btn btn-info btn" id="btn-filter" style="width: 100%;"><i class="fas fa-eye"></i> All Member [New]</a>
          </div>
          
          <div class="form-group  mb-lg-0 ml-lg-2">
            <a type="button" href="<?php echo base_url();?>laporan/member/flat" class="btn btn-info btn" id="btn-filter" style="width: 100%;"><i class="fas fa-eye"></i> Data Member [Flat]</a>
          </div>

          <div class="form-group  mb-lg-0 ml-lg-2">
            <a type="button" href="<?php echo base_url();?>laporan/member/grouping" class="btn btn-info btn" id="btn-filter" style="width: 100%;"><i class="fas fa-eye"></i> Data Member [Grouping]</a>
          </div>

          <div class="form-group  mb-lg-0 ml-lg-2">
            <a type="button" href="<?php echo base_url();?>laporan/member/multi" class="btn btn-info btn" id="btn-filter" style="width: 100%;"><i class="fas fa-eye"></i> Data Member [Multiple]</a>
          </div>

        </div>
      </div>
    </div>
  </div>


  <div class="card card-info card-outline" id="filter">
    <div class="card-header">
      <div class="container-fluid">
        <form id="main-form" enctype="multipart/form-data" method="POST" action="<?php echo base_url();?>laporan/member/import_excel">
            <div class="d-flex justify-content-end  align-items-star w-100 flex-md-row flex-column">
              <h3 class="card-title align-self-center">Import dari Excel: </h3>
              <div class="form-group  mb-lg-0 ml-lg-2">
                <input type="file" class="form-control" name="file">
              </div>
              <div class="form-group  mb-lg-0 ml-lg-2">
                <input type="submit"class="btn btn-info btn" style="width: 100%;" value="Upload">
              </div>
    
            </div>
        </form>
      </div>
    </div>
  </div>