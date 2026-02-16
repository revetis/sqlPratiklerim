use t167;

/*
======================== HAVING CLAUSE ======================= 

 HAVING, GROUP BY ile gruplandırılmış sonuçlar üzerinde 
 koşul belirlemek için kullanılır.

 Yeni oluşturulan (örneğin GROUP BY ile türetilen) 
 alanlar üzerinde filtreleme yapılacaksa, 
 HAVING cümleciği kullanılmalıdır; 
 çünkü WHERE yalnızca veri tabanında doğrudan var olan alanlar için filtreleme yapar.
===============================================================
*/


 /*  
========================  ORNEK  ========================
 Icerisinde id, isim, sehir ve maas field'lari olan 
 isciler tablosu oluşturun ve içine null olmayan değerler ekleyin.
=========================================================
 */
 





 CREATE TABLE isciler
(
	id int,
	isim varchar(50),
    sehir varchar(20),
    maas int,
	sirket varchar(20)
);

INSERT INTO isciler VALUES 
(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'),
(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'),
(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'),
(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'),
(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'),
(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'),
(123456710, 'Hatıce Sahin', 'Bursa', 4500, 'Honda');


SELECT * 
FROM isciler;








 /*  
========================  ORNEK  ========================
 Şirketlere göre toplam isçi sayısını listeleyin.
=========================================================
 */

SELECT sirket , COUNT(isim) FROM isciler GROUP BY sirket;

SELECT * from isciler;




 /*  
========================  ORNEK  ========================
 İşçi sayısı 1'den büyük olan şirketleri listeleyin.
=========================================================
 */

SELECT sirket , COUNT(isim) AS isci_sayisi FROM isciler GROUP BY sirket HAVING isci_sayisi > 1;






 /*  
========================  ORNEK  ========================
 toplam geliri 8000 liradan fazla olan isimleri gösteren sorgu yazın. 
 İsimleri gruplandırarak soruyu çözümleyin.
=========================================================
 */


SELECT isim,SUM(maas) AS isimin_toplam_geliri FROM isciler GROUP BY isim HAVING isimin_toplam_geliri > 8000;






 /*  
========================  ORNEK  ========================
 Eğer bir şehirde alınan MAX maaş 5000'den düşükse 
 şehir ismini ve MAX maaşı veren sorgu yazın.
=========================================================
 */


SELECT sehir,MAX(maas) AS enfazla_maas FROM isciler GROUP BY sehir HAVING enfazla_maas < 5000;







 /*  
========================  ORNEK  ========================
 Eğer bir şehirde alınan MAX maaş 3500'den büyükse 
 şehir ismi 'i' harfi ile başlıyorsa o şehirleri 
 ve MAX maaşı, maaş ters sıralı veren sorgu yazın.
=========================================================
 */


SELECT sehir,MAX(maas) AS enfazla_maas FROM isciler WHERE sehir LIKE 'i%' GROUP BY sehir HAVING enfazla_maas > 3500 ORDER BY enfazla_maas DESC;



