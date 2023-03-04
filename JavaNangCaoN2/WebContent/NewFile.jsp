<form action="" id="my_form"></form>
			<a class="btn btn-primary add_btn js-login" href="#">Thêm</a>
			<table class="tb_gh"
				style="width: 100%; top: 6em; position: relative; text-align: center;">

				<thead>
					<tr>
						<th style="width: 14%">Mã sách</th>
						<th style="width: 12%">Sản phẩm</th>
						<th style="width: 15%">Tên sách</th>
						<th style="width: 6%">Số tập</th>
						<th style="width: 15%">Tác giả</th>
						<th style="width: 12%">Giá</th>
						<th style="width: 6%">Số lượng</th>
						<th style="width: 12%">Ngày nhập</th>
						<th style="width: 8%; align-items: center">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dssach }" var="d">
						<tr>
							<td data-th="Mã sách">${d.getMasach()}</td>
							<td data-th="Sản phẩm"><img src="${d.getAnh() }"></td>
							<td data-th="Tên sách">${d.getTensach()}</td>
							<td data-th="Số tập">$d.getSotap()</td>
							<td data-th="Tác giả">${d.getTacgia() }</td>
							
							<td data-th="Giá">${d.getGia() }</td>
							<td data-th="Số lượng">${d.getSoluong()}</td>
							<td data-th="Ngày nhập">${d.getNgaynhap()}</td>
							<td data-th="Thao tác"><a class="thaotac"
								href="adminLoaitTSXController?hd=update&ms=${d.getMaloai() }">
									Sửa </a> <a class="thaotac"
								href="adminLoaitTSXController?hd=remove&ms=${d.getMaloai()}">
									Xoá </a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>