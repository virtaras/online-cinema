/* Russian (UTF-8) initialisation for the jQuery UI date picker plugin. */
/* Written by Andrew Stromnov (stromnov@gmail.com). */
jQuery(function($){
	$.datepicker.regional['ru'] = {
		clearText: '��������', clearStatus: '',
		closeText: '�������', closeStatus: '',
		prevText: '&#x3c;����',  prevStatus: '',
		prevBigText: '&#x3c;&#x3c;', prevBigStatus: '',
		nextText: '����&#x3e;', nextStatus: '',
		nextBigText: '&#x3e;&#x3e;', nextBigStatus: '',
		currentText: '�������', currentStatus: '',
		monthNames: ['������','�������','����','������','���','����',
		'����','������','��������','�������','������','�������'],
		monthNamesShort: ['���','���','���','���','���','���',
		'���','���','���','���','���','���'],
		monthStatus: '', yearStatus: '',
		weekHeader: '��', weekStatus: '',
		dayNames: ['�����������','�����������','�������','�����','�������','�������','�������'],
		dayNamesShort: ['���','���','���','���','���','���','���'],
		dayNamesMin: ['��','��','��','��','��','��','��'],
		dayStatus: 'DD', dateStatus: 'D, M d',
		dateFormat: 'yy-mm-dd', firstDay: 1,
		initStatus: '', isRTL: false};
	$.datepicker.setDefaults($.datepicker.regional['ru']);
});