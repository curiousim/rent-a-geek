import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css'; // Note this is important!

  flatpickr('.datepicker', {
  enableTime: true,
  minDate: new Date()
});
