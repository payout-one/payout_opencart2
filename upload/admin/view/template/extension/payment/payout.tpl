<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-payout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if (isset($error['error_warning'])) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payout" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-statuses" data-toggle="tab"><?php echo $tab_order_statuses; ?></a></li>
						<li><a href="#tab-about" data-toggle="tab"><?php echo $tab_about; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<div class="form-group">
								<div class="col-sm-2 text-right"><strong><?php echo $text_notification_url; ?></strong></div>
								<div class="col-sm-10"><samp><?php echo $notification_url; ?></samp></div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="entry-client_id"><span data-toggle="tooltip" title="<?php echo $help_client_id; ?>"><?php echo $entry_client_id; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="payout_client_id" value="<?php echo $payout_client_id; ?>" placeholder="<?php echo $entry_client_id; ?>" id="entry-client_id" class="form-control"/>
									<?php if ($error_client_id) { ?>
									<div class="text-danger"><?php echo $error_client_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="entry-client_secret"><span data-toggle="tooltip" title="<?php echo $help_client_secret; ?>"><?php echo $entry_client_secret; ?>:</span></label>
								<div class="col-sm-10">
									<input type="text" name="payout_client_secret" value="<?php echo $payout_client_secret; ?>" placeholder="<?php echo $payout_client_secret; ?>" id="entry-client_secret" class="form-control"/>
									<?php if ($error_client_secret) { ?>
									<div class="text-danger"><?php echo $error_client_secret; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-live-demo"><span data-toggle="tooltip" title="<?php echo $help_test; ?>"><?php echo $entry_test; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_sandbox" id="input-live-demo" class="form-control">
										<?php if ($payout_sandbox) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug; ?>"><?php echo $entry_debug; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_debug" id="input-debug" class="form-control">
										<?php if ($payout_debug) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?>:</span></label>
								<div class="col-sm-10">
									<input type="text" name="payout_total" value="<?php echo $payout_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
								<div class="col-sm-10">
									<select name="payout_geo_zone_id" id="input-geo-zone" class="form-control">
										<option value="0"><?php echo $text_all_zones; ?></option>
										<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $payout_geo_zone_id) { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="payout_status" id="input-status" class="form-control">
										<?php if ($payout_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?>:</label>
								<div class="col-sm-10">
									<input type="text" name="payout_sort_order" value="<?php echo $payout_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-statuses">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-processing-status"><span data-toggle="tooltip" title="<?php echo $help_processing_status; ?>"><?php echo $entry_processing_status; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_processing_status_id" id="input-processing-status" class="form-control">
										<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $payout_processing_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-success-status"><span data-toggle="tooltip" title="<?php echo $help_success_status; ?>"><?php echo $entry_success_status; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_success_status_id" id="input-success-status" class="form-control">
										<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $payout_success_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-expired-status"><span data-toggle="tooltip" title="<?php echo $help_expired_status; ?>"><?php echo $entry_expired_status; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_expired_status_id" id="input-expired-status" class="form-control">
										<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $payout_expired_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-failed-status"><span data-toggle="tooltip" title="<?php echo $help_failed_status; ?>"><?php echo $entry_failed_status; ?></span></label>
								<div class="col-sm-10">
									<select name="payout_failed_status_id" id="input-failed-status" class="form-control">
										<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $payout_failed_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-notify"><?php echo $entry_notify; ?></label>
								<div class="col-sm-10">
									<select name="payout_notify" id="input-notify" class="form-control">
										<?php if ($payout_notify) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-about">
							<div class="form-group">
								<div class="col-sm-12"><h4><?php echo $text_title; ?></h4></div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 text-right"><strong><?php echo $text_version; ?></strong></div>
								<div class="col-sm-10"><?php echo $info_version; ?></div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 text-right"><strong><?php echo $text_compatibility; ?></strong></div>
								<div class="col-sm-10"><?php echo $info_compatibility; ?></div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 text-right"><strong><?php echo $text_documentation; ?></strong></div>
								<div class="col-sm-10"><?php echo $info_documentation; ?></div>
							</div>
							<div class="form-group">
								<div class="col-sm-2 text-right"><strong><?php echo $text_license; ?></strong></div>
								<div class="col-sm-10"><?php echo $info_license; ?></div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
