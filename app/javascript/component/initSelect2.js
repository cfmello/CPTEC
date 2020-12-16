import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('#practitioner').select2();
  $('#field_area').select2();
};

export { initSelect2 };