<!--
<?php echo $text_license; ?>
-->

<?php if (isset($payout_error)) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $payout_error; ?></div>
<?php } ?>

<?php if ($testmode) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_testmode; ?></div>
	<div class="alert alert-info">payout_php version <?php echo $payout_php_ver; ?><br>payout_opencart2 version <?php echo $payout_oc_ver; ?></div>
<?php } ?>

<?php if (!isset($payout_error)) { ?>
	<form action="<?php echo $checkout_url; ?>index.php" method="get" id="form-payout">
		<div class="buttons">
			<input type="hidden" name="route" value="<?php echo $checkout_route; ?>" />
			<div class="pull-right">
				<input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
			</div>
		</div>
	</form>
<?php } ?>