$(function() {
  $('#role').change(function(){
  $('.role').hide();
  $('#' + $(this).val()).show();
  });
});
$(function() {
  $("#delete").click(function(){
      const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
      confirmButton: 'btn btn-success',
      cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false,
      })
      swalWithBootstrapButtons.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true
      }).then((result) => {
      if (result.value) {
      swalWithBootstrapButtons.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
      )
      } else if (
      // Read more about handling dismissals
      result.dismiss === Swal.DismissReason.cancel
      ) {
      swalWithBootstrapButtons.fire(
      'Cancelled',
      'Your imaginary file is safe :)',
      'error'
      )
      }
      });
  });
});
$(document).ready(function(){
  $(".toggle-sideBar").click(function(){
    $(".assideNav-panel").toggleClass("toggle-left");
    $(".main-container").toggleClass("toggle-left");
  });
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
  $($.fn.dataTable.tables(true)).DataTable()
  .columns.adjust();
  }); 
  // DataTable
  $('#example').DataTable({
  dom: 'Bfrtip',
  buttons: [
  'copyHtml5',
  'excelHtml5',
  'csvHtml5',
  'pdfHtml5',
  'print'
  ]
  });
  $('#example2').DataTable({
  dom: 'Bfrtip',
  buttons: [
  'copyHtml5',
  'excelHtml5',
  'csvHtml5',
  'pdfHtml5',
  'print'
  ]
  });
  $('#example3').DataTable({
  dom: 'Bfrtip',
  buttons: [
  'copyHtml5',
  'excelHtml5',
  'csvHtml5',
  'pdfHtml5',
  'print'
  ]
  });
  $('#example4').DataTable({
  dom: 'Bfrtip',
  buttons: [
  'copyHtml5',
  'excelHtml5',
  'csvHtml5',
  'pdfHtml5',
  'print'
  ]
  });
  $('#example1').DataTable(
  {
  dom: 'Bfrtip',
  buttons: [
  'copyHtml5',
  'excelHtml5',
  'csvHtml5',
  'pdfHtml5',
  'print'
  ]
  });
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
  $($.fn.dataTable.tables(true)).DataTable()
  .columns.adjust();
  }); 
  //popover
  $('[data-toggle="popover"]').popover();   
  // Datepicker
  $( ".datepicker" ).datepicker({
  changeMonth: true,
  changeYear: true
  });
  //file upload
  document.getElementById("uploadBtn").onchange = function () {
  document.getElementById("uploadFile").value = this.value.substring(12);
  };

});
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
});