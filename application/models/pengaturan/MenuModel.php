<?php
defined('BASEPATH') or exit('No direct script access allowed');

class MenuModel extends Render_Model
{


	public function getAllData()
	{
		$exe = $this->db->select(' a.*, b.menu_nama as parent ')
			->from(' menu a ')
			->join(' menu b ', ' b.menu_id = a.menu_menu_id ', ' left ')
			->get();

		return $exe->result_array();
	}


	public function getMenuParent()
	{
		$exe = $this->db->select(' menu_id, menu_nama ')
			->order_by(' menu_index ', ' asc ')
			->where(' menu_menu_id ', 0)
			->get(' menu ');

		return $exe->result_array();
	}


	public function getDataDetail($id)
	{
		$exe = $this->db->get_where('menu', ['menu_id' => $id]);

		return $exe->row_array();
	}


	public function getIsiMenuBy($where = [null])
	{
		$this->db->select(' a.*, b.menu_nama as parent ');
		$this->db->from(' menu a ');
		$this->db->join(' menu b ', ' b.menu_id = a.menu_menu_id ', ' left ');
		$this->db->where($where);
		$exe = $this->db->get();
		if ($exe->num_rows() > 0) {
			$exe = $exe->row_array();
		} else {
			$exe = ' ';
		}

		return $exe;
	}

	public function insert($menu_menu_id, $nama, $index, $icon, $url, $keterangan, $status)
	{
		$this->db->trans_start();
		$data['menu_menu_id']    = $menu_menu_id;
		$data['menu_nama']       = $nama;
		$data['menu_index']      = $index;
		$data['menu_icon']       = $icon;
		$data['menu_url']        = $url;
		$data['menu_keterangan'] = $keterangan;
		$data['menu_status']     = $status;

		$execute                 = $this->db->insert('menu', $data);
		$exe['id']               = $this->db->insert_id();
		$exe['parent']           = $this->cekMenu($menu_menu_id);
		if ($execute) {
			$modul           = $this->getMenuTitle();
			$id              = $this->db->insert_id();
			$by              = $this->getLogId();
			$jenis_perubahan = 1;
			$parent = $this->getIsiTableById('menu', ['menu_id' => $menu_menu_id])['menu_nama'];
			$data_lama       = "Belum ada data";
			$data_baru       = "Menambah data baru dengan isi parent = $parent, menu_nama = $nama, menu_index = $index, menu_icon = $icon, menu_url = $url, menu_keterangan = $keterangan, menu_status = $status";
			$this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
		}
		$this->db->trans_complete();

		return $exe;
	}


	public function update($id, $menu_menu_id, $nama, $index, $icon, $url, $keterangan, $status)
	{
		$this->db->trans_start();
		$sebelumnya = $this->getIsiMenuBy(['a.menu_id' => $id]);
		$data['menu_menu_id']    = $menu_menu_id;
		$data['menu_nama']       = $nama;
		$data['menu_index']      = $index;
		$data['menu_icon']       = $icon;
		$data['menu_url']        = $url;
		$data['menu_keterangan'] = $keterangan;
		$data['menu_status']     = $status;

		$execute                 = $this->db->where('menu_id', $id);
		$execute                 = $this->db->update('menu', $data);
		$exe['id']               = $id;
		$exe['parent']           = $this->cekMenu($menu_menu_id);
		if ($execute) {
			$modul           = $this->getMenuTitle();
			$by              = $this->getLogId();
			$jenis_perubahan = 2;
			$parent = $this->getIsiTableById('menu', ['menu_id' => $menu_menu_id])['menu_nama'];
			$data_lama       = "Isi data sebelumnya adalah parent = $sebelumnya[parent], menu_nama = $sebelumnya[menu_nama], menu_index = $sebelumnya[menu_index], menu_icon = $sebelumnya[menu_icon], menu_url = $sebelumnya[menu_url], menu_keterangan = $sebelumnya[menu_keterangan], menu_status = $sebelumnya[menu_status]";
			$data_baru       = "Mengubah isi data sebelumnya menjadi parent = $parent, menu_nama = $nama, menu_index = $index, menu_icon = $icon, menu_url = $url, menu_keterangan = $keterangan, menu_status = $status";
			$this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
		}
		$this->db->trans_complete();


		return $exe;
	}


	public function delete($id)
	{
		$this->db->trans_start();
		$sebelumnya = $this->getIsiMenuBy(['a.menu_id' => $id]);
		$exe = $this->db->where('menu_id', $id);
		$exe = $this->db->delete('menu');
		if ($exe) {
			$modul           = $this->getMenuTitle();
			$by              = $this->getLogId();
			$jenis_perubahan = 3;
			$data_lama       = "Isi data sebelumnya adalah parent = $sebelumnya[parent], menu_nama = $sebelumnya[menu_nama], menu_index = $sebelumnya[menu_index], menu_icon = $sebelumnya[menu_icon], menu_url = $sebelumnya[menu_url], menu_keterangan = $sebelumnya[menu_keterangan], menu_status = $sebelumnya[menu_status]";
			$data_baru       = "Menghapus data lama";
			$this->setActivityLog($modul, $by, $jenis_perubahan, $data_lama, $data_baru);
		}
		$this->db->trans_complete();

		return $exe;
	}
}

/* End of file MenuModel.php */
/* Location: ./application/models/pengaturan/MenuModel.php */