using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Collections;

namespace ConsoleApplication1
{
    /// <summary>
    /// Формирователь BRAM строк из бинарного файла ASM PDP-11.
    /// </summary>
    class Program
    {
        // ВАЖНО!!! Количество байт в бинарном файле должно быть ЧЕТНЫМ! Иначе .brm файл не будет создан!

        /// <summary>
        /// Main pointer in application.
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            string path = string.Empty;
            string path1 = string.Empty;
            string display = "BIN2BRAM Convereter.\nLetuchiy Soft 2023 ver 000.104\n";
            StreamWriter wr = null;

            if (args.Length >= 2)
            {
                Console.WriteLine(display);

                path = Directory.GetCurrentDirectory() + "\\" + args[0].ToString();

                path1 = Directory.GetCurrentDirectory() + "\\" + args[1].ToString();                

                string tmp = string.Empty;

                string outBnr = GetBytesPDP(path);

                if (outBnr != string.Empty)
                {
                    try
                    {
                        tmp = bin2bramFPGA(outBnr);
                        wr = new StreamWriter(path1, false);
                        wr.Write(tmp.Split('~')[0].ToString());
                    }
                    catch (Exception eee)
                    {
                        System.Diagnostics.Debug.WriteLine(eee.Message);
                        Console.WriteLine(eee.Message);
                    }
                    finally
                    {
                        if (wr != null)
                        {
                            wr.Flush();
                            wr.Close();
                        }
                    }

                    Console.WriteLine(int.Parse(tmp.Split('~')[1].ToString()) + " lines put in BRAM module.");
                    Console.WriteLine("File " + args[1].ToString() + " created.");
                }
                else
                {
                    Console.WriteLine(".BIN file format is not correct,\nthe number of bytes in the .bin\nfile is not even!\nPlease provide correct file!");
                }

                
                Console.WriteLine("Press any key to continue.");
                Console.Read();
            }
            else
            {
                Console.WriteLine(display);
                Console.WriteLine("Format: - PDPConverterToForth.exe file.bin file.brm");
                Console.WriteLine("Press any key.");
                Console.Read();
            }
        }


        /// <summary>
        /// Read bytes from .bin file to string.
        /// </summary>
        /// <param name="pt">Path to .bin file</param>
        /// <returns></returns>
        static string GetBytesPDP(string pt)
        {
            string strout = string.Empty;
            FileStream fs = null;           
            BinaryReader reader = null;
            long lnbyte = 0;
            byte[] bt = null;

            try
            {
                if (File.Exists(pt))
                {
                    fs = File.Open(pt, FileMode.Open);
                    reader = new BinaryReader(fs, Encoding.UTF8);
                    lnbyte = reader.BaseStream.Length;
                    
                    bt = reader.ReadBytes((int)lnbyte);

                    if ((bt.Length % 2) == 0 && bt.Length > 0)
                    {
                        strout = BitConverter.ToString(bt);

                        strout = strout.Replace("-", "");
                    }
                    else
                    {
                        strout = string.Empty;
                    }
                }
                else
                {
                    strout = string.Empty;
                }
            }
            catch(Exception exx)
            {
                Console.WriteLine(exx.Message);
                System.Diagnostics.Debug.WriteLine(exx.Message);
            }
            finally
            {
                if (reader != null && fs != null)
                {                    
                    reader.Close();                    
                    fs.Close();
                }
            }

            return strout;
        }

        /// <summary>
        /// BRAM creater.
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        static string bin2bramFPGA(string s)
        {
            
            string b = ".INIT_";
            string bb = "(256'h";
            string c = string.Empty;
            string d = string.Empty;
            string pareA = string.Empty;
            string pareB = string.Empty;

            string mainOut = string.Empty;

            int rev = 0;
            const int devCnst = 64;

            int zzz = 0;

            // Кратное или не кратное 64м символам для строки BRAM.
            if ((s.Length % devCnst) == 0)
            {
                zzz = s.Length / devCnst;
            }
            else
            {
                zzz = s.Length / devCnst + 1; 
            }

            // Формирователь строк для записи в BRAM модуль.
            for (int f = 0; f < zzz; f++)
            {
                for (int z = 0; z <= 15; z++)
                {
                    pareA += s[rev].ToString() + s[rev + 1].ToString();
                    rev += 2;
                    pareB += s[rev].ToString() + s[rev + 1].ToString();
                    rev += 2;

                    if (z <= 14)
                    {
                        c += "_" + pareB + pareA;
                    }
                    else
                    {
                        c += pareB + pareA;
                    }

                    d = c + d;

                    c = string.Empty;
                    pareA = string.Empty;
                    pareB = string.Empty;
                }

                if (f.ToString().Length == 1 || 
                        (f.ToString("X") == "A" ||
                            f.ToString("X") == "B" ||
                                f.ToString("X") == "C" ||
                                    f.ToString("X") == "D" ||
                                        f.ToString("X") == "E" ||
                                            f.ToString("X") == "F"))
                {
                    d = b + "0" + f.ToString("X") + bb + d;
                }
                else
                {
                    d = b + f.ToString("X") + bb + d;
                }

                mainOut = mainOut + d + "),\n";                          
                d = string.Empty;

                // Добиваем хвостик если обработанных символов меньше чем 64!
                if ((s.Length - rev) < 64)
                {
                    for (int w = s.Length - rev; w < 64; w++)
                    {
                        s += "0";
                    }                    
                }                

            }

            return mainOut + "~" + zzz.ToString();
        }
    }
}
