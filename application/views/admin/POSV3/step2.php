<div>
	<?php echo form_open('Pos3/step1_next'); ?>
	<table class="table hovered bordered striped">
		<tr>
			<th colspan="2">Form Transaksi La-Derma</th>
		</tr>
		<tr align="center">
			<td>Nama Dokter</td>
			<td><input list="dokter" name="dokter" placeholder="masukan nama dokter" class="form-control" value="<?php echo $dokter ?>" disabled=""></td>
		</tr>
		<tr align="center">
			<td>Nama Pasien</td>
			<td><input list="pasien" name="pasien" placeholder="masukan nama pasien" class="form-control" value="<?php echo $pasien ?>" disabled=""></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" name="next" class="button warning" value="Selanjutnya"></td>
		</tr>
	</table>
	<?php echo form_close(); ?>
</div>