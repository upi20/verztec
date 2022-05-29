<div class="d-md-flex flex-row justify-content-end  align-items-center mb-3">
    <label for="from" class="mb-md-0">From</label>
    <div class="form-group mb-md-0">
        <input type="text" class="form-control date-filter" name="from" id="from" value="06/2022" placeholder="" />
    </div>
    <label for="to" class="mb-md-0 ml-md-3">To</label>
    <div class="form-group mb-md-0">
        <input type="text" class="form-control date-filter" name="to" id="to" value="12/2022" placeholder="" />
    </div>
    <div>
        <button type="button" class="btn btn-info btn no-wrap  ml-md-3"><i class="fas fa-search"></i> Search</button>
    </div>
</div>
<div class="row">
    <div class="col-md-3 col-sm-12">
        <!-- small box -->
        <div class="small-box bg-info">
            <div class="inner">
                <h3>1500</h3>

                <p>Subscription Count</p>
            </div>
            <div class="icon">
                <i class="far fa-user"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
        </div>
    </div>
    <!-- ./col -->
    <div class="col-md-3 col-sm-12">
        <!-- small box -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3><sup style="font-size: 20px">$</sup>18,230.00</h3>

                <p>Revenue Sum</p>
            </div>
            <div class="icon">
                <i class="fas fa-dollar-sign"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
        </div>
    </div>
</div>

<div class="row">
    <!-- Subcription -->
    <div class="col-lg-6 col-md-12">
        <div class="card">
            <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                    <h3 class="card-title">Subcription</h3>
                    <a href="javascript:void(0);">View Report</a>
                </div>
            </div>
            <div class="card-body">
                <div class="d-flex">
                    <p class="d-flex flex-column">
                        <span class="text-bold text-lg">1230</span>
                        <span>Subcription Over Time</span>
                    </p>
                    <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-success">
                            <i class="fas fa-arrow-up"></i> 33.1%
                        </span>
                        <span class="text-muted">Since last month</span>
                    </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                    <canvas id="subcription-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                    <span class="mr-2">
                        <i class="fas fa-square text-gray"></i> This year
                    </span>

                    <span>
                        <i class="fas fa-square text-info"></i> Last year
                    </span>
                </div>
            </div>
        </div>
    </div>

    <!-- revenue -->
    <div class="col-lg-6 col-md-12">
        <div class="card">
            <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                    <h3 class="card-title">Revenue</h3>
                    <a href="javascript:void(0);">View Report</a>
                </div>
            </div>
            <div class="card-body">
                <div class="d-flex">
                    <p class="d-flex flex-column">
                        <span class="text-bold text-lg">$18,230.00</span>
                        <span>Revenue Over Time</span>
                    </p>
                    <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-success">
                            <i class="fas fa-arrow-up"></i> 33.1%
                        </span>
                        <span class="text-muted">Since last month</span>
                    </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                    <canvas id="sales-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                    <span class="mr-2">
                        <i class="fas fa-square text-gray"></i> This year
                    </span>

                    <span>
                        <i class="fas fa-square text-success"></i> Last year
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>