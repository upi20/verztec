<?php
defined('BASEPATH') or exit('No direct script access allowed');

class LoginApi extends Render_Controller
{

	public function index()
	{
		$this->sesion->cek_login_api();
		$this->load->view('templates/login-api');
		// $this->content = 'login-api';
	}


	public function doLogin()
	{
		$username 	= $this->input->post('email');
		$password 	= $this->input->post('password');

		// Cek login ke model
		$login 		= $this->login->cekLogin($username, $password);

		if ($login['status'] == 0) {
			// Set session value

			// email belum di verifikasi
			if ($login['data'][0]['user_email_status'] == 0) {
				$this->output_json(['status' => 5]);
			}
			// akun aktif
			else if ($login['data'][0]['user_status'] == 1) {
				$session = array(
					'status' => true,
					'data'	 => array(
						'id' => $login['data'][0]['user_id'],
						'nama' => $login['data'][0]['user_nama'],
						'email' => $login['data'][0]['user_email'],
						'level' => $login['data'][0]['lev_nama'],
						'level_id' => $login['data'][0]['lev_id'],
					)
				);

				$this->session->set_userdata($session);

				$this->output_json(['status' => 0]);
			}
			// akun di nonaktifkan
			else if ($login['data'][0]['user_status'] == 0) {
				$this->output_json(['status' => 3]);
			}
			// menunggu dikonfirmasi
			else if ($login['data'][0]['user_status'] == 2) {
				$this->output_json(['status' => 4]);
			}
			// erorr
			else {
				$this->output_json(['status' => 5]);
			}
		} else if ($login['status'] == 1) {
			$this->output_json(['status' => 1]);
		} else {
			$this->output_json(['status' => 2]);
		}
	}


	public function logout()
	{
		$session = array('status', 'data');

		$this->session->unset_userdata($session);

		redirect('login', 'refresh');
	}

	public function konfirmasi_email()
	{
		$token = $this->input->get('t');
		$cleanToken = $this->security->xss_clean($token);
		$user_info = $this->login->isTokenValid($this->base64url_decode($cleanToken));
		if (!$user_info) {
			$this->session->set_flashdata('message', 'Token tidak valid atau kadaluarsa');
			redirect(base_url('login'), 'refresh');
		} else {
			$result = $this->db->where('user_id', $user_info->user_id)->update('users', ['user_email_status' => '1']);
			if ($result) {
				$this->session->set_flashdata(['message' => [
					'message' => 'Email berhasil dikonfirmasi',
					'status' => true
				]]);

				// delete token
				$this->db->where('user_id', $user_info->user_id)->delete('tokens');
			} else {
				$this->session->set_flashdata('message', 'Email gagal dikonfirmasi');
			}
			redirect(base_url('login'), 'refresh');
		}
	}
	function __construct()
	{
		parent::__construct();
		$this->load->model('loginModel', 'login');
		$this->default_template = 'templates/login';
		$this->load->library('plugin');
		$this->load->helper('url');
	}
}

/* End of file Login.php */
/* Location: ./application/controllers/Login.php */