<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DefaultModel extends Render_Model
{

	public function menu()
	{
		$user = $this->session->userdata('data');

		if ($user) {
			$session_id = $user['id'];
			$where = array(
				'b.menu_menu_id' 	=> 0,
				'b.menu_status' 	=> 'Aktif',
				'd.role_user_id' 	=> $session_id
			);

			$query = $this->db->select("*,
			(IFNULL((SELECT term_management.nama FROM term_management
            WHERE term_management.id_menu = b.menu_id and term_management.status < 2 limit 1), '')) as nama")
				->join('menu b', 'b.menu_id = a.rola_menu_id')
				->join('level c', 'c.lev_id = a.rola_lev_id')
				->join('role_users d', 'd.role_lev_id = c.lev_id')
				// ->join('term_management e', 'e.id_menu = b.menu_id', 'left')
				->order_by('b.menu_index', 'asc')
				->get_where('role_aplikasi a', $where)
				->result_array();
		} else {
			$query = [];
		}

		return $query;
	}

	public function sub_menu($menu_id = null)
	{
		$session_id = $this->session->userdata('data')['id'];

		$where = array(
			'b.menu_menu_id' 	=> $menu_id,
			'b.menu_status' 	=> 'Aktif',
			'd.role_user_id' 	=> $session_id
		);

		$query = $this->db->select('*')
			->join('menu b', 'b.menu_id = a.rola_menu_id')
			->join('level c', 'c.lev_id = a.rola_lev_id')
			->join('role_users d', 'd.role_lev_id = c.lev_id')
			->join('term_management e', 'e.id_menu = b.menu_id', 'left')
			->order_by('b.menu_index', 'asc')
			->get_where('role_aplikasi a', $where)
			->result_array();

		return $query;
	}
}
