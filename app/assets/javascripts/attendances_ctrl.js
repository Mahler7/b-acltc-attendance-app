var attendances = new Vue({
  el: '#attendances',
  data: {
    attendances: [],
    attendance: {
      attended: '',
      student_id: '',
      lecture_id: ''
    },
    errors: {}
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/api/v1/lectures/' + that.lecture_id + '/attendances.json',
      success: function(res) {
        that.attendances = res;
      }
    });
  },
  methods: {
    addAttendance: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          attendance: that.attendance,
        },
        url: '/api/v1/lectures/' + that.lecture_id + '/attendances.json',
        success: function(res) {
          that.errors = {}
          that.attendance = {}
          that.attendances.push(res);
          $('.attendances-checkbox').hide();
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    },
  }
});